Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070846B65C7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPb-0003Pn-7E; Sun, 12 Mar 2023 08:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPU-0003Nd-3r
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:47 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPS-0000KI-12
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:43 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn21so7938059edb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rI8ZsjBtffxcL2MjNujcgsY63aeYdjHaEBqzmv9u0lo=;
 b=Bb3Kpzk2SxtKUqOKzwTifF1IA803ECM2pISHjBQ2M7dCXP/bjxvszlgJwciRFmpLlf
 wpbLHQ5FK99teDs8LawQjNEa6zlc5rgQg64kL5P0zKn+W+cxBBVTblF/mUJ5ZRb4Qu/j
 n9nPXQ/92Jh9tZN0O9DytfiFLFkJBo3sCHQDMNTgrfnYDShpasisGLrZClJe4jQSCSVG
 1tokue7jyNcDFAhZMyA2O1cOi1h+dJR04uK43hD4hd25u2k4EIbibib2sj0BmmJOFaDn
 F+DM1dCZNoBvTPn9bY4nzRMaVkHh/tdyHv+MJkjSb4Eq+AczXyOLmt/MUH77b1i5Gj79
 aFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rI8ZsjBtffxcL2MjNujcgsY63aeYdjHaEBqzmv9u0lo=;
 b=inlUTfjDPbOUi+rW2Z+xzgOdBtZVHzfolpQsgLJ2RAZxqLVHLIkzF2w14WKs3ZAoQM
 YeAIs6yl2Kr5Cg4ntbmv/YNzVTDagLjW0ElrqBgJLIsFelv1C/AS6QhaSaVHSx5/8ZKZ
 v2ty5B8DRFFhoPOLaIxgjF6TpClWBThs79G6mfpqkW1toh64aQkjMNxq/nQUiSC3lG8e
 MVZyde89N6tIum2JbUtaD66p0F11uKemB+SkgVXknDPaCip2NzgsHzEU6UoDj88fSr2l
 EPAzsL1yJCCqWxjw8IijGBPeCv0mS19JDJiJfgzwEWwXuO3IgpGsaE90eF8rKpH3WXyZ
 OyZg==
X-Gm-Message-State: AO0yUKVhQUUWWY90bHypH4BM+clXv+nfmXq6S7C683UvDtO+UtzpMGop
 HoB056/3PwaS3asumST2bKQcQw0q1tY=
X-Google-Smtp-Source: AK7set/AVzddu1+FdWEl/xC+HlzhM5PISCHhkaw6fcOuZgxBkpinOZysAximKBKKHBg8Pp5SPwa/xA==
X-Received: by 2002:a17:906:5a6e:b0:926:e917:133c with SMTP id
 my46-20020a1709065a6e00b00926e917133cmr1303514ejc.47.1678622560375; 
 Sun, 12 Mar 2023 05:02:40 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 6/6] hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE
Date: Sun, 12 Mar 2023 13:02:21 +0100
Message-Id: <20230312120221.99183-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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
2.39.2


