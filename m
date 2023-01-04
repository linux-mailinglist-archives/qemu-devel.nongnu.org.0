Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27665D67D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 15:47:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD51a-0005IG-GQ; Wed, 04 Jan 2023 09:45:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51J-0005Fn-9n
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:40 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pD51H-0002rl-Jb
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 09:45:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id g10so11942566wmo.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 06:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4FebSrd6qw4EtXuaelySJNjsiB1Oj70YbVnrwvN8/I=;
 b=lMKvYCGOWYmnaT84GaMb23/VAi195oDQudE1wLzcerQEkKvvtsHLGjOSg3Wp4GFafE
 XEtBgvv3xHIUWKKXmH1Ae9427VzyfEBA7cUKnYZSZvXPXSBefmryW+xa2Iv6VyKgWZfs
 r85U50UOY19i1THGPSpmLtkLrbogJ7ind85Uxcyqly4kLwW+iIYVU0SFYWcvUyE/B88b
 LnK2tJgHA8CffJ4VpAQZujNkJQGRaVtif+jOh2hKIW0Htmy+z0Ns9XHX5CwsqjO/ECtm
 2O5VciXS7zNEcI+bZMOyLKHtdkcj+Ej/CLxWUUVLE1r7h5cOkCZL6K1xhBFqGNEijOdc
 pK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E4FebSrd6qw4EtXuaelySJNjsiB1Oj70YbVnrwvN8/I=;
 b=fNzF6O9+00nS0Q3RSCpoL8VK5CxQD3+8JtgVjceTU5bCt+CMjnjLvg5PU0FZk2rI+9
 nbsS73xIBn6KjC14yAvQyM4z3cboNE3JeHJwG82bXG14fHbNUQhDrtbrCV1mXDIt40It
 N0NPaw/QfxBcDNqOJlv9fCItiBV7ApH9S/Yy+8rOWeWxLxK0yJxPRukEwUT551dtD94G
 YMOOMdbHVrDCKnq4KbU5bPvRbxILTgBBThhnKkYQKI8OPor5BfJAul5Zkj7Zx4nSdcWR
 FTXxtaCX8u/fPQ7n8/AtKG69H/IFIpk9Kf8SnNExE8tTvbrjkWZyRednKnOG6FPD8XHh
 41Og==
X-Gm-Message-State: AFqh2kpMPzfz7eiQqLVfuf4ItaE1CYcMV2mIm6b5Q0QQYrfLqPwX26r7
 NpUtwGkWQvy0r5rT3PUFw/rpewYp/8SrSw==
X-Google-Smtp-Source: AMrXdXsYGgxoZWnwVZ7yR7arNry46fXICAla5+IdicOq5hbJrnHe2MpsGju5mZBACJ42RwflZH2L8w==
X-Received: by 2002:a05:600c:54cb:b0:3cf:d0be:1231 with SMTP id
 iw11-20020a05600c54cb00b003cfd0be1231mr41547624wmb.13.1672843529178; 
 Wed, 04 Jan 2023 06:45:29 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d594a000000b0028663fc8f4csm21168241wri.30.2023.01.04.06.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 06:45:28 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 6/6] hw/isa/piix: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Wed,  4 Jan 2023 15:44:37 +0100
Message-Id: <20230104144437.27479-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230104144437.27479-1-shentey@gmail.com>
References: <20230104144437.27479-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
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
index 5738d9cdca..6b8de3d59d 100644
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


